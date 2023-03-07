// const [currentPage, setCurrentPage] = useState(1);

const data = [
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
  { nama: "fadli" },
];

const tagLevels = [
  {
    id: 1,
    tag_id: 1,
    name: "ini satu",
  },
  {
    id: 2,
    tag_id: 1,
    name: "ini dua",
  },
  {
    id: 3,
    tag_id: 2,
    name: "ini tga",
  },
  {
    id: 4,
    name: "ini empat",
    tag_id: 3,
  },
  {
    id: 5,
    tag_id: 3,
    name: "ini limat",
  },
];

const tagId = [
  {
    id: 1,
    name: "S1",
  },
  {
    id: 2,
    name: "S2",
  },
  {
    id: 3,
    name: "S3",
  },
];

const dataTagLevels = tagLevels.filter((tagData) => {
  tagId.forEach((e) => {
    return tagData.tag_id === e.id;
  });
});

const dataCopy = data
  .filter((e, index) => (index <= 9 ? true : false))
  .map((e, i) => ({
    nama: e.nama,
    index: i,
  }));

console.log(dataCopy);

// tag_id

// get tag id, 1, 2, 3
// response => context, useContext
// tag_id tinggal reference si context nya itu

//
